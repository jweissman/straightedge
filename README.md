# straightedge

[![Code Climate](https://codeclimate.com/github/jweissman/straightedge/badges/gpa.svg)](https://codeclimate.com/github/jweissman/straightedge)

* [Homepage](https://rubygems.org/gems/straightedge)
* [Documentation](http://rubydoc.info/gems/straightedge/frames)
* [Email](mailto:jweissman1986 at gmail.com)

## Description

  Give me a compass and straightedge and I will conquer the world

  [![Compass and Straightedge XKCD](http://imgs.xkcd.com/comics/compass_and_straightedge.png)](http://xkcd.com/866/) 

  Geometry primitives and graphical app (game) framework framework.

## Features

    * Geometry toolkit 
      - extensible Compass
      - Ruler (for measuring distances)

    * Figures composed of points called Marks
      - Line
      - Quadrilateral
      - Hexagon

    * Some fledgling support for grids

    * Some reactor-pattern framework platform components
      to help standardize interfaces (see straightedge-gosu
      and straightedge-canvas for examples)

## Examples

    require 'straightedge'

    # you need an adapter to actually render something
    require 'straightedge-gosu'

    class Example::GameController < Straightedge::Director
      def current_scene
        {
	  [200,300] => Quadrilateral.new(dimensions: [200,100], color: :green),
	  [200,305] => "rectangle",

	  [400,300] => Hexagon.new(scale: 40.0, color: :blue),
	  [400,305] => "hexagon"
	}
      end
    end

## Requirements

   Ruby 2.x should be enough

## Install

    $ gem install straightedge

## Synopsis

    Eventually it would be nice to support a CLI that wraps around tasks (note: not implemented yet)
    
    $ straightedge create [app] — builds an example app skeleton
    $ straightedge serve — stands up a canvas webserver
    $ straightedge play  — connects to local instance or plays through OpenGL adapter… etc

## Copyright

Copyright (c) 2014 Joseph Weissman

See {file:LICENSE.txt} for details.
