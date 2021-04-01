#pragma once

#include <boost/optional.hpp>

#include "kirkpatrick.h"

using visualization::viewer_adapter;
using geom::structures::point_type;

struct kirkpatrick_viewer : viewer_adapter {
   kirkpatrick_viewer();
   void draw(visualization::drawer_type&) const;
   void print(visualization::printer_type&) const;
   bool on_key(int key);
   bool on_move(point_type const&);
   bool on_release(point_type const&);
private:
   void add_point(point_type const&);
   void save();
   void load();
private:
   enum class viewer_state { POLY_INPUT, QUERY } _state;
   std::string _status;
   std::vector<point_type> _points;
   bool _poly_complete;
   point_type _move_point;
   static int time_for_warning;
   // QUERY only
   boost::optional<kirkpatrick_type> _kirkpatrick;
   boost::optional<point_type> _query_point;
   bool _query_hit;
};
