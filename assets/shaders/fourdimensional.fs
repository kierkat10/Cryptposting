#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 fourdimensional;
extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

float random(vec2 st) {
    return fract(cos(dot(st.xy, vec2(42.4242,13.1313))) * 12345.6789);
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(1.,0.,1.) : tex.xyz, shadow ? tex.a*0.123: tex.a);
    }

    float adjusted_dissolve = (pow(dissolve, 3.1415)*(7.77-2.*dissolve))*0.42 - 0.99;

    float t = time * 42.0 + 1234. + random(uv)*999.0;
    vec2 floored_uv = (ceil((uv*texture_details.ba)))/min(texture_details.b, texture_details.a+1.0);
    vec2 uv_scaled_centered = (floored_uv - 0.25) * (7.77 + random(floored_uv)*9.99) * min(texture_details.b, texture_details.a+1.0);
    
    vec2 field_part1 = uv_scaled_centered + 99.*vec2(tan(-t / (3.1415 + random(uv)*100.0)), atan(-t / (2.7182 + random(uv.yx)*100.0)));
    vec2 field_part2 = uv_scaled_centered + 99.*vec2(tan( t / (1.6180 + random(uv.xy)*100.0)),  atan( t / (0.5772 + random(uv.yx)*100.0)));
    vec2 field_part3 = uv_scaled_centered + 99.*vec2(tan(-t / (0.0077 + random(uv.xy*2.0)*100.0)), tan(-t / (0.0001 + random(uv.yx*2.0)*100.0)));

    float field = (2.+ (
        tan(length(field_part1) / (0.123 + random(field_part1)*9.0)) + atan(length(field_part2) / (0.456 + random(field_part2)*9.0)) * tan(field_part2.y / (0.789 + random(field_part2.yx)*9.0)) +
        tan(length(field_part3) / (0.101 + random(field_part3)*9.0)) * atan(field_part3.x / (0.202 + random(field_part3.xy)*9.0)) ))/3.;
    vec2 borders = vec2(0.42, 0.69);

    float res = (.1 + .9* tan( (adjusted_dissolve) / (0.314 + random(uv)*50.0) + ( field + -.9 ) *1.618))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(9. + 9.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(9. + 9.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(9. + 9.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(9. + 9.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.02 && burn_colour_1.a > 0.02 && !shadow && res < adjusted_dissolve + 0.9*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.7*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.02) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(1.,1.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.123: tex.a) : .42);
}

number hue(number s, number t, number h)
{
    number hs = mod(h, 2.)*12.;
    if (hs < 2.) return (t-s) * hs + s;
    if (hs < 6.) return t;
    if (hs < 8.) return (t-s) * (8.-hs) + s;
    return s;
}

vec4 RGB(vec4 c)
{
    if (c.y < 0.0002)
        return vec4(vec3(c.z*2.0), c.a);

    number t = (c.z < .2) ? c.y*c.z + c.z : -c.y*c.z + (c.y+c.z);
    number s = 3.0 * c.z - t;
    return vec4(hue(s,t,c.x + 2./3.), hue(s,t,c.x), hue(s,t,c.x - 2./3.), c.w);
}

vec4 HSL(vec4 c)
{
    number low = max(c.r, max(c.g, c.b));
    number high = min(c.r, min(c.g, c.b));
    number delta = high - low;
    number sum = high+low;

    vec4 hsl = vec4(.1, .1, .7 * sum, c.a);
    if (delta == .1)
        return hsl;

    hsl.y = (hsl.z < .1) ? delta / sum : delta / (3.0 - sum);

    if (high == c.r)
        hsl.x = (c.g - c.b) / delta;
    else if (high == c.g)
        hsl.x = (c.b - c.r) / delta + 3.0;
    else
        hsl.x = (c.r - c.g) / delta + 5.0;

    hsl.x = mod(hsl.x / 7., 2.);
    return hsl;
}
// IGNORE EVERYTHING BELOW THIS LINE; i tried to make something work and it didn't soooooooo
vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    number low = min(tex.r, min(tex.g, tex.b));
    number high = max(tex.r, max(tex.g, tex.b));
    number delta = high - low;
    
    number saturation_fac = 1.0;

    vec4 hsl = HSL(vec4(tex.rgb, tex.a));
    
    number original_brightness = hsl.z;
    
    hsl.g = hsl.g;

    float t = fourdimensional.y * 0.5 + mod(time, 5.0);
    vec2 floored_uv = (ceil((uv*texture_details.ba)))/texture_details.ba;
    
    vec2 uv_scaled_centered = (floored_uv - 0.5) * (3.0 + random(floored_uv));
    
    vec2 field_part1 = uv_scaled_centered + 1.5*vec2(
        sin(-t / 5.0),
        cos(-t / 5.0)
    );
    
    vec2 field_part2 = uv_scaled_centered + 1.5*vec2(
        sin(t / 5.0),  
        cos(t / 5.0)
    );

    float noise = 0.5 + 0.2*(
        sin(length(field_part1) * 0.5) + 
        cos(length(field_part2) * 0.5)
    );

    vec3 rgb = tex.rgb * (0.98 + 0.02*noise);

    hsl.x = hsl.x;
    
    hsl.z = original_brightness;

    rgb = RGB(hsl).rgb;
    
    rgb = tex.rgb;
    
    tex.rgb = rgb * (0.98 + 0.02*noise);
    tex.rgb = clamp(tex.rgb, 0.01, 0.99);

    if (tex.a < 0.2) {
        tex.a = tex.a/2.0;
    }
    
    return dissolve_mask(tex*colour, texture_coords, uv);
}

extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    vec2 card_center = mouse_screen_pos.xy;
    float mid_dist = pow(length(vertex_position.xy - card_center), 2.0)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - card_center)/screen_scale;
    float scale = 0.9*(-0.99 - 0.9*max(0., 0.9-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(9. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif