import { Gtk } from "astal/gtk4";

export default () => {
  return (
    <box cssName="workspace-info" halign={Gtk.Align.START}>
      <box cssName="information" orientation={Gtk.Orientation.VERTICAL}>
        <label cssName="name" label="Astro@arch" />
        <label cssName="workspace" label="Workspace 1" />
      </box>
      <box cssName="workspace-display">
        <box cssName="active-workspace" />
        <box cssName="inactive-workspace">
          <label cssName="h1" label="2" />
        </box>
      </box>
    </box>
  );
};
