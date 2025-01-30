import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable } from "astal";
import { Icon } from "astal/gtk3/widget";
import GdkPixbuf from "gi://GdkPixbuf?version=2.0";
import GLib from "gi://GLib?version=2.0";

const pfp_path = `${GLib.get_home_dir()}/.config/ags/icons/profile-picture.png`;
const pfp_pixbuf = GdkPixbuf.Pixbuf.new_from_file(pfp_path);

const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor;
export default function Bar(monitor: number) {
  return (
    <centerbox className="Bar">
      <Icon
        vexpand={true}
        halign={Gtk.Align.START}
        className="profile_picture"
        pixbuf={pfp_pixbuf}
      />
    </centerbox>
  );
}
