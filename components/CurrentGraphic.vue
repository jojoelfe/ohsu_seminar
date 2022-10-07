<template>
  <div class="current-container"></div>
</template>

<script>
import * as d3 from "d3";
export default {
  props: {
    angle: 0
  },
  beforeDestroy () {
	clearInterval(this.polling)
},
  mounted: function() {
    var margin = { top: 20, right: 20, bottom: 40, left: 40 };
    var width = 435 - margin.left - margin.right;
    var height = 460 - margin.top - margin.bottom;
    var numTicks = 10;
    var tickSpace = 8;
    var that = this;
    var y = d3
      .scaleLinear()
      .range([height, 0])
      .domain([-1, 1]);
    this.y = y;
    var x = d3
      .scaleLinear()
      .range([0, width])
      .domain([-1, 1]);
    this.x = x;
    var body = d3
      .select(this.$el)
      // .select('.current-container')
      .append("svg")
      .attr("preserveAspectRatio", "xMinYMin meet")
      .attr("viewBox", "0 0 435 460")
      .style("width", "80%")
      .style("margin", "auto");

    this.svg = body
      .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var svg = this.svg;
    body
      .append("rect")
      .attr("width", width + margin.left + margin.right)
      .style("opacity", 0.0)
      .attr("height", height + margin.top + margin.bottom);

    
    svg
      .append("text")
      .attr(
        "transform",
        "translate(" + width / 2 + "," + (height + margin.top + 20) + ")"
      )
      .style("text-anchor", "middle")
      .style("font-size", "1.4em")
      .attr("dy", "-0.3em")

      .text("Time");

    
    svg
      .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 0 - margin.left)
      .attr("x", 0 - height / 2)
      .attr("dy", "1em")
      .style("text-anchor", "middle")
      .style("font-size","1.4em")
      .text("Current");
      svg.append("defs").append("marker")
    .attr("id", "arrowhead")
    .attr("refX", 5)
    .attr("refY", 7)
    .attr("markerWidth", 13)
    .attr("markerHeight", 13)
    .attr("orient", "up")
    .append("path")
    .attr("d", "M2,2 L2,13 L8,7 L2,2");
   
var xa = svg.append("g")
  .attr("class", "x axis")
  .attr("transform", "translate(0," + height + ")")      
  .style("dominant-baseline", "central")
  .style("stroke-width","2")
.append("path")
.attr("d","M0 0 L"+width+" 0")
.attr("marker-end", "url(#arrowhead)");
var xa = svg.append("g")
  .attr("class", "y axis")
  .attr("transform", "translate(0," + height + ")")      
  .style("dominant-baseline", "central")
  .style("stroke-width","2")
.append("path")
.attr("d","M0 0 L0 -"+height);

    var line = d3
      .line()
      .defined(function(d) { return d.y > -1; })
      
      .x(function(d) {
        return x(d.x);
      })
      .y(function(d) {
        return y(d.y);
      })
      .curve(d3.curveCardinal.tension(1));
    this.line = line;
    this.datap = [];
    svg
      .append("clipPath")
      .attr("id", "clip")
      .append("rect")
      .attr("width", width)
      .attr("height", height);

    svg
      .append("path")
      .datum(this.datap)
      .attr("class", "line")
     // .attr("clip-path", "url(#clip)")
      .attr("d", line)
      .style("stroke-width", 2);

    this.counter = 0;
    this.polling = setInterval(() => {
      if (that.counter < 250) {
      that.datap.push({
        x: that.counter,
        y: that.angle + Math.random()
      });
      } else {
        that.datap[that.counter % 250] ={
        x: that.counter % 250,
        y: that.angle + Math.random()
      };
      that.datap[(that.counter % 250) +1 ] ={
        x: (that.counter % 250) +1 ,
        y: -5
      };
      }

      that.x.domain([0, 250]);

      that.y.domain([-2, 35]);

      /* this.svg.select('.x').call(
        d3
          .axisBottom(this.x)
          .tickSize(-height)
          .ticks(numTicks)
      )
      this.svg.select('.y').call(
        d3
          .axisLeft(this.y)
          .tickSize(-width)
          .ticks(numTicks)
      ) */

      that.counter += 1;
      that.svg
        .select(".line")
        .datum(this.datap)
        .attr("d", this.line);
    }, 50);
  }
};
</script>

<style  lang="scss">
.current-container {
  display: inline-block;
  position: relative;
  padding-bottom: 100%;
  vertical-align: top;
  overflow: hidden;

  svg {
    position: absolute;
    top: 50%;
    bottom: 50%;
    //transform:translate(50%, 50%);
  }

  .axis text {
    fill: none;
  }

  .axis path {
    stroke: #000000;
  }

  .axis line {
    stroke: #000;
  }

  .background {
  }

  #chart {
    text-align: center;
  }

  .dots {
  }

  .line {
    stroke: #999900;
    stroke-width: 2;
    stroke-opacity: 1;
    fill: none;
  }
}
</style>
