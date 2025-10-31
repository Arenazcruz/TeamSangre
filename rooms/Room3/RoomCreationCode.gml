target = obj_player;

cam_w = 320;
cam_h = 180;

cam = camera_create();
camera_set_view_size(cam, cam_w, cam_h);
view_camera[0]  = cam;
view_visible[0] = true;

var win_w = display_get_width();
var win_h = display_get_height();
view_wport[0] = win_w;
view_hport[0] = win_h;
