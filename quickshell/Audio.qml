import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
	id: root

	// Bind the pipewire node so its volume will be tracked
	PwObjectTracker {
		objects: [ Pipewire.defaultAudioSink ]
	}

	Connections {
		target: Pipewire.defaultAudioSink?.audio

		function onVolumeChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}

		function onMutedChanged() {
			root.shouldShowOsd = true;
			hideTimer.restart();
		}
	}

	property bool shouldShowOsd: false

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: root.shouldShowOsd = false
	}

	// The OSD window will be created and destroyed based on shouldShowOsd.
	// PanelWindow.visible could be set instead of using a loader, but using
	// a loader will reduce the memory overhead when the window isn't open.
	LazyLoader {
		active: root.shouldShowOsd

		PanelWindow {
			// Since the panel's screen is unset, it will be picked by the compositor
			// when the window is created. Most compositors pick the current active monitor.
			WlrLayershell.layer: WlrLayer.Overlay
			mask: Region {}
			anchors{
				bottom: true
				left: true
			}
			color: "transparent"
			implicitWidth: screen.width
			Rectangle{
				anchors {
					left: parent.left
					bottom: parent.bottom
				}
				implicitHeight:3
				implicitWidth: getWidth()
				color: !Pipewire.defaultAudioSink?.audio.muted ? "#ace1af" : "#485349"
				
				function getWidth(){
					if (Pipewire.defaultAudioSink?.audio.muted){
						return parent.width;
					}
					return parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
				}
			}
		}
	}
}
