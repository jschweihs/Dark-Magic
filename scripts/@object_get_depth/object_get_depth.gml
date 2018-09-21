/// @description Sets the depth of the given object.
/// @param {Number} index The index of the object to change
/// @param {Number} depth The new depth of the object
var objID = argument0;
if (object_exists(objID)) {
    with( objID ) {
        global.__objectID2Depth[id] = argument0;
    } // end with
} // end if