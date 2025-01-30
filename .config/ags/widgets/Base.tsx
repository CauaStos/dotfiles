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
        anchor={BOTTOM | LEFT | RIGHT | TOP}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        application={App}
        clickThrough
      />

      <window
        monitor={monitor}
        className="Corner_Fill"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        application={App}
        widthRequest={1960} //  width - barheight + borderwidth * 2
        heightRequest={1120} // If not bar transparent, exclusivity = none and height + borderwidth * 2
        clickThrough
      />

      <window
        visible
        monitor={monitor}
        className="Bar"
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}
      >
        <Bar />
      </window>
    </>
  );
};
