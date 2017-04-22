/**
* circle_path.scad
*
* Sometimes you need all points on the path of a circle. Here's 
* the function. Its $fa, $fs and $fn parameters are consistent 
* with the circle module.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-circle_path.html
*
**/


    
function circle_path(radius) =
    let(
        _frags = $fn > 0 ? 
            ($fn >= 3 ? $fn : 3) : 
            max(min(360 / $fa, radius * 2 * 3.14159 / $fs), 5)
    )
    [
        for(a = [0 : 360 / _frags : 360 - 360 / _frags]) 
            [radius * cos(a), radius * sin(a)]
    ];
