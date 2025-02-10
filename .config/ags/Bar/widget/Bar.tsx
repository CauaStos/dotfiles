import { App, Astal, Gtk, Gdk } from "astal/gtk4";
import { Variable } from "astal";
import WorkspaceInfo from "./components/WorkspaceInfo";

const time = Variable("").poll(1000, "date");

export default function Bar(monitor: number) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      visible
      cssClasses={["Bar"]}
      monitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
    >
      <WorkspaceInfo />
    </window>
  );
}
