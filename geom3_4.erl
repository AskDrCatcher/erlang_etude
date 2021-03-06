-module(geom3_4).
-export([area/1]).

%% @doc Calculates the area of a shape, given the
%% shape and two of the dimensions. Returns the product
%% of its arguments for a rectangle, one half the
%% product of the arguments for a triangle, and
%% math:pi times the product of the arguments for
%% an ellipse.

-spec(area({atom(), number(), number()}) -> number()).
area({Shape, X, Y}) ->
    area(Shape, X, Y).

-spec(area(atom(), number(), number()) -> number()).
area(rectangle, L, W) when L >= 0, W >= 0 -> L * W;

area(triangle, B, H) when B >= 0, H >= 0 -> (B * H) / 2.0;

area(ellipse, A, B) when A >= 0, B >= 0 -> math:pi() * A * B;

area(_, _, _) -> 0.
