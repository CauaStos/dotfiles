import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable } from "astal";
import Bar from "./Bar/Bar";

const time = Variable("").poll(1000, "date");
const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor;
export default (monitor: number) => {
  return (
    <>
      <window
        monitor={monitor}
        className="Corners"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        application={App}
        clickThrough={true}
        widthRequest={1965}
        heightRequest={1090}
      />

      <window
        monitor={monitor}
        className="Bar"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={BOTTOM | LEFT | RIGHT}
        application={App}
      >
        <Bar />
      </window>
      {/* <window
        className="Inner_Corner"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={BOTTOM | LEFT | RIGHT | TOP}
        application={App}
        clickThrough={true}
      /> */}
    </>
  );
};
