var mx=keyboard_check(vk_right)-keyboard_check(vk_left);
var my=keyboard_check(vk_down)-keyboard_check(vk_up);

if (mx != 0 && my != 0){
    var inv = 1 / sqrt(2);
    mx *= inv; my *= inv;
}

hsp = mx * spd;
vsp = my * spd;

if (hsp != 0 && place_meeting(x + hsp, y, obj_muro)) {
    var sx = sign(hsp);
    while (!place_meeting(x + sx, y, obj_muro)) x += sx;
    hsp = 0;
}
x += hsp;

if (vsp != 0 && place_meeting(x, y + vsp, obj_muro)) {
    var sy = sign(vsp);
    while (!place_meeting(x, y + sy, obj_muro)) y += sy;
    vsp = 0;
}
y += vsp;

var moving = (abs(hsp) > 0.001) || (abs(vsp) > 0.001);
if (moving){
    if (abs(hsp) > abs(vsp)) 
	facing = (hsp > 0) ? 0 : 1;
    else 
	facing = (vsp > 0) ? 2 : 3;
}

if (moving){
    sprite_index = spr_move[facing];
    image_speed = anim_walk_speed;
} else {
    sprite_index = spr_idle[facing];
    image_speed = 0;
    image_index = 0;
}
