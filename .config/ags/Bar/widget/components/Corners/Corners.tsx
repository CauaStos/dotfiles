import { App, Astal, Gtk, Gdk, Widget, astalify } from "astal/gtk4";
import cairo from "gi://cairo?version=1.0";
import GObject from "gi://GObject";
import Gsk from "gi://Gsk";
import { exec, Gio, GLib, monitorFile, readFile } from "astal";
import giCairo from "cairo";

function draw_corners(
  screen_width: number,
  screen_height: number,
  context: giCairo.Context,
) {
  const radius = 10; // Corner radius
  const width = screen_width;
  const height = screen_height * 0.94; //$bar_height: calc($screen-height * 0.06);

  context.setLineWidth(3);
  //Upper left corner
  context.moveTo(0, radius);
  context.arc(radius, radius, radius, Math.PI, Math.PI * 1.5);
  context.lineTo(0, 0);

  //Upper Right Corner
  context.moveTo(width, 0);
  context.arc(width - radius, radius, radius, -0.5 * Math.PI, 0);
  context.lineTo(width, radius);

  //Bottom Left Corner
  context.moveTo(0, height);
  context.arc(0 + radius, height - radius, radius, Math.PI * 0.5, Math.PI);
  context.lineTo(0, height);

  //Bottom Right Corner
  context.moveTo(width, height);
  context.arc(
    width - radius,
    height - radius,
    radius,
    0 * Math.PI,
    Math.PI * 0.5,
  );
  context.lineTo(width, height);

  //Set Color
  const home = GLib.get_home_dir();
  const color = readFile(
    `${home}/.config/ags/Bar/widget/components/Corners/color.txt`,
  ).trim();
  const line_color = new Gdk.RGBA();
  line_color.parse(color);
  context.setSourceRGBA(
    line_color.red,
    line_color.green,
    line_color.blue,
    line_color.alpha,
  );

  //Fill and Stroke
  context.fill();
  context.stroke();
}

export default function Corners(gdkmonitor: Gdk.Monitor) {
  const DrawingArea = astalify(Gtk.DrawingArea);
  return (
    <window
      visible
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.NORMAL}
      keymode={Astal.Keymode.NONE}
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.LEFT |
        Astal.WindowAnchor.RIGHT |
        Astal.WindowAnchor.BOTTOM
      }
      setup={(self) => {
        const native = self.get_native();
        if (native) {
          const surface = native.get_surface();
          const region = new cairo.Region();
          surface?.set_input_region(region);
          self.queue_draw();
          self.set_visible(true);
        }
      }}
      application={App}
    >
      <DrawingArea
        setup={(self) => {
          const home = GLib.get_home_dir();
          monitorFile(
            `${home}/.config/ags/Bar/widget/components/Corners/color.txt`,
            () => self.queue_draw(),
          );

          self.set_draw_func((drawingarea, context) => {
            const screen_width = gdkmonitor.get_geometry().width;
            const screen_height = gdkmonitor.get_geometry().height;
            draw_corners(
              screen_width,
              screen_height,
              context as giCairo.Context,
            );
          });
        }}
      />
    </window>
  );
}
