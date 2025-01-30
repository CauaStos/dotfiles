import { Window } from "astal/gtk3/widget";

export default function Test(monitor = 0) {
  return (
    <Window monitor={monitor} visible>
      <box>Content of the widget</box>
    </Window>
  );
}
