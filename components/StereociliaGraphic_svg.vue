<template>
  <div class="comp-container" @mousedown="startMove">
    <div class="sc-container">
      <img src="./assets/cell.svg" style="position:absolute;top:25px;right:45px;height:500px;z-index:-1;">
    </div>
  </div>
</template>

<script>
import * as d3 from "d3";
import cell from "./assets/cell.svg";
import { findIntersect } from "./collision.js";
export default {
  name: "StereociliaGraphic",
  components: {},
  props: {
    scWidth: {
      default: 87
    },
    scTaper: {
      default: 20
    },
    scTaperHeight: {
      default: 30
    },
    scTaperBias: {
      default: 0.6
    },
    scSep: {
      default: 30
    },
    scBot: {
      default: 630
    },
    scLowBias: {
      default: 0.8
    },
    scXPos: {
      default: 1371
    },
    scMemColor: {
      default: "#333333"
    },
    scActinColor: {
      default: "#bbbbbb"
    },
    scTipColor: {
      default: "#aaaaff"
    },
    zoom: {
      default: false,
      type: Boolean
    }
  },
  data: function() {
    return {
      memAngle: 35,
      ctx: false,
      canvas: false,
      rc: false,
      stereocilia: [],
      probePos: {
        cx: 100,
        cy: 100,
        r: 50
      },
      angle: 0,
      direction: 1,
      moving: false
    };
  },
  computed: {
    sin: function() {
      let rotation = this.angle * (Math.PI / 180);
      return Math.sin(rotation);
    },
    cos: function() {
      let rotation = this.angle * (Math.PI / 180);
      return Math.cos(rotation);
    },
    bundlePath: function() {
      return [
        this.getStereociliaPath(1, 80),
        this.getStereociliaPath(2, 180),
        this.getStereociliaPath(3, 280),
        this.getStereociliaPath(4, 380, 0)
      ];
    },
    tpAngle: function() {
      var that = this;
      let tpVecX =
        that.bundlePath[1][5][0] - (that.bundlePath[2][4][0] - that.sin * 35);
      let tpVecY =
        that.bundlePath[1][5][1] - (that.bundlePath[2][4][1] + that.cos * 35);
      let tpAngleAbs = (Math.atan2(tpVecY, tpVecX) / Math.PI) * 180;
      return 180 - tpAngleAbs + Number(that.angle);
    }
  },
  watch: {
    angle() {
      this.drawLineUpdate();
    },
    probePos: {
      handler() {
        this.drawLineUpdate();
      },
      deep: true
    },
    memAngle() {
      this.drawLineUpdate();
    }
  },
  mounted: function() {
    console.log("/" + cell + "");
    
    this.svg = d3
      .select(this.$el)
      .select(".sc-container")
      .append("svg")
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 1920 1080")
      .style("max-height", "100%")
      .classed("sc-content", true)
      .node();

      this.polygon1 = d3.select(this.svg).append("polygon").attr("id","polygon1").style("fill","none").style("stroke","none");
      this.polygon2 = d3.select(this.svg).append("polygon").attr("id","polygon2").style("fill","none").style("stroke","none");

    this.drawLine();
  },
  methods: {
    startMove(evt) {
      const touch = false;
      if (!touch && evt.button !== 0) return;
      const events = touch
        ? {
            move: "touchmove",
            stop: "touchend"
          }
        : {
            move: "mousemove",
            stop: "mouseup"
          };
      const elem = this.svg;
      const point = elem.createSVGPoint();
      const transform = elem.getScreenCTM().inverse();
      const circlePos = this.probePos;
      const getPos = touch ? getTouchPos : this.getMousePos;

      var newPt;
      this.moving = !this.moving;
      
      const updateFn = () => {
        if (this.moving) requestAnimationFrame(updateFn);

        // Map the screen pixels back to svg coords
        newPt = point.matrixTransform(transform);
        circlePos.cx = newPt.x + 960;
        circlePos.cy = newPt.y + 540;
      };
      const moveFn = evt => getPos(evt, point);
     

      requestAnimationFrame(updateFn);
      moveFn(evt);
      if (this.moving) {
        elem.addEventListener(events.move, moveFn);
      } else {
        elem.removeEventListener(events.move, moveFn);
      }
    },

    getMousePos(mouseEvent, point) {
      point.x = mouseEvent.clientX;
      point.y = mouseEvent.clientY;
      
    },
    getStereociliaPath(x, length, low = 1, zoom = [1, [70, 500]]) {
      var that = this;
      var points = [
        [-0.5 * (this.scWidth + this.scSep), 0], // BottomLeft
        [-0.5 * (this.scWidth + this.scSep) + 0.5 * this.scSep, 0],
        [
          -0.5 * (this.scWidth + this.scSep) + 0.5 * this.scSep + this.scTaper,
          this.scTaperHeight * this.scTaperBias
        ],
        [
          -0.5 * (this.scWidth + this.scSep) + 0.5 * this.scSep,
          2 * this.scTaperHeight
        ], // AngleChange start here
        [-0.5 * (this.scWidth + this.scSep) + 0.5 * this.scSep, length],
        [
          0 * (this.scWidth + this.scSep) +
            low * this.scLowBias * 0.5 * this.scWidth,
          length + this.scWidth * 0.5
        ], // Tip
        [0 * (this.scWidth + this.scSep) + 0.5 * this.scWidth, length],
        [
          0 * (this.scWidth + this.scSep) + 0.5 * this.scWidth,
          2 * this.scTaperHeight
        ], // AngleChange end here
        [
          0 * (this.scWidth + this.scSep) + 0.5 * this.scWidth - this.scTaper,
          this.scTaperHeight * this.scTaperBias
        ],
        [0.5 * (this.scWidth + this.scSep) - 0.5 * this.scSep, 0],
        [0.5 * (this.scWidth + this.scSep), 0] // BottomRight
      ];

      points = points
        .slice(0, 2)
        .concat(
          points
            .slice(2, 9)
            .map(x => [
              that.cos * x[0] + that.sin * x[1],
              that.cos * x[1] - that.sin * x[0]
            ]),
          points.slice(9)
        );

      points = points.map(x => [x[0]-212, -x[1] + this.scBot+7]); // Fix Y coordinate
      points = points.map(a => [
        a[0] + (x - 0.5) * (this.scWidth + this.scSep) + this.scXPos,
        a[1]
      ]); // Fix X coordinate
      points = points.map(x => [
        (x[0] - zoom[1][0]) * zoom[0] + zoom[1][0],
        (x[1] - zoom[1][1]) * zoom[0] + zoom[1][1]
      ]);
      return points;
    },
    getLigthingPath(origin, scale = 0.1) {
      var points = [
        [40, -120],
        [-40, -60],
        [20, -60],
        [-60, 0],
        [0, 0],
        [-80, 60],
        [-90, 50],
        [-100, 80],
        [-70, 70],
        [-80, 60]
      ];

      points = points.map(x => [
        x[0] * scale + origin[0],
        x[1] * scale + origin[1]
      ]);
      return points;
    },
    drawLineUpdate() {
      var that = this;

      d3.select(that.svg)
        .select("pattern")

        .attr("patternTransform", "rotate(" + that.angle + " 250 630)");
      that.probecircle
        .attr("cx", function(d) {
          return that.probePos.cx;
        })
        .attr("cy", function(d) {
          return that.probePos.cy;
        })
        .attr("r", function(d) {
          return 50;
        })
        .style("fill", function(d) {
          return "black";
        });
      var inters = 0;
      that.bundlePath.forEach(function(data, index) {
        var pathGen = d3
          .line()
          .curve(d3.curveCardinal.tension(0.4))
          .x(function(d) {
            return d[0];
          })
          .y(function(d) {
            return d[1];
          })
          .context(null);
        var bundle = d3.select(that.svg)
          .select("#s" + index + ".stereocilia")

          .attr("d", pathGen(data));
        inters += findIntersect(that.probecircle.node(),bundle.node(),that.polygon1.node(),that.polygon2.node(),that.svg);
        if (index > 0) {
          d3.select(that.svg)
            .select("#t" + index + ".tiplink")
            .attr("x1", that.bundlePath[index - 1][5][0])
            .attr("y1", that.bundlePath[index - 1][5][1])
            .attr("x2", that.bundlePath[index][4][0] - that.sin * 35)
            .attr("y2", that.bundlePath[index][4][1] + that.cos * 35);
        }
      });

      if (inters > 0 && that.angle < 30 ) {
        that.angle += 2;
        that.$emit('angle',that.angle);
        that.direction = 1;
      } else if (inters == 0 && that.angle > 0 && that.direction < 1) {
        that.angle -= 2;
        that.$emit('angle',that.angle);
        that.direction = -1;
      } else if (inters ==0) {
         that.direction = 0;
      }
    },
    drawLine() {
      var that = this;

      d3.select(that.svg)
        .append("pattern")
        .attr("id", "diagonalHatch")
        .attr("width", 15)
        .attr("height", 10)
        .attr("patternTransform", "rotate(" + that.angle + " 0 0)")
        .attr("patternUnits", "userSpaceOnUse")
        .append("line")
        .attr("x1", 0)
        .attr("y1", 0)
        .attr("x2", 0)
        .attr("y2", 10)
        .style("stroke", that.scActinColor)
        .style("stroke-width", 8);
      that.probecircle = d3
        .select(that.svg)
        .append("circle")
        .attr("cx", function(d) {
          return that.probePos.cx;
        })
        .attr("cy", function(d) {
          return that.probePos.cy;
        })
        .attr("r", function(d) {
          return 50;
        })
        .style("fill", function(d) {
          return "black";
        });

      that.bundlePath.forEach(function(data, index) {
        var pathGen = d3
          .line()
          .curve(d3.curveCardinal.tension(0.4))
          .x(function(d) {
            return d[0];
          })
          .y(function(d) {
            return d[1];
          })
          .context(null);
        d3.select(that.svg)
          .append("path")
          .classed("stereocilia", true)
          .attr("id", function() {
            return "s" + index;
          })
          .attr("d", pathGen(data))
          .style("stroke", that.scMemColor)
          .style("stroke-width", 2)
          .style("fill", "url(#diagonalHatch)");
        if (index > 0) {
          d3.select(that.svg)
            .append("line")
            .classed("tiplink", true)
            .attr("id", function() {
              return "t" + index;
            })
            .attr("x1", that.bundlePath[index - 1][5][0])
            .attr("y1", that.bundlePath[index - 1][5][1])
            .attr("x2", that.bundlePath[index][4][0] - that.sin * 35)
            .attr("y2", that.bundlePath[index][4][1] + that.cos * 35)
            .style("stroke", that.scTipColor)
            .style("stroke-width", 3);
        }
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style >
.comp-container {
  display: inline-block;

  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  
  vertical-align: top;
  overflow: hidden;
  grid-column: 2;
  grid-row: 1;
}
.sc-container {
  max-height: 100%;
}

.sc-content {
  display: inline-block;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  max-height: 100%;
}
</style>
