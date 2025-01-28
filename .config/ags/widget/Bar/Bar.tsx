import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable } from "astal";

const time = Variable("").poll(1000, "date");
const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor;
export default function Bar(monitor: number) {
  return (
    <centerbox>
      <button onClicked="echo hello" halign={Gtk.Align.CENTER}>
        Welcome to AGS!
      </button>
      <box />
      <button onClicked={() => print("hello")} halign={Gtk.Align.CENTER}>
        <label label={time()} />
      </button>
    </centerbox>
  );
}
