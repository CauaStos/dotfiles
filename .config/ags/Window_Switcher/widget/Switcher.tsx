import { App, Astal, Gtk, Gdk } from "astal/gtk4";
import AstalHyprland from "gi://AstalHyprland?version=0.1";
import { switcherVisible } from "./switcher_daemon";
import Grid from "./components/Grid";
import GdkWayland from "gi://GdkWayland?version=4.0";

export default () => {
  const monitoractive = AstalHyprland.get_default().get_focused_monitor();
  const screen_width = monitoractive.get_width();
  const screen_height = monitoractive.get_height();
  App.apply_css(`
    :root{
    --width: ${screen_width}px;
    --height: ${screen_height}px;
    }
    `);
  return (
    <window
      application={App}
      title="Switcher"
      layer={Astal.Layer.OVERLAY}
      visible={switcherVisible((value) => value)}
      css_classes={["window-switcher"]}
      resizable={false}
      valign={Gtk.Align.CENTER}
      halign={Gtk.Align.CENTER}
      monitor={0}
      keymode={0}
    >
      <Grid />
    </window>
  );
};
