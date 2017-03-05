if (window.top !== window.self) window.top.location.replace(window.self.location.href);

window.tryFirePostponedFunc = function(requiredFlags, func) {

    if (Object.prototype.toString.call( window.initializationFlags ) === '[object Array]')
        return;
    var i, len = requiredFlags.length;
    for(i = 0; i < len; i++)
        if (myInArray(requiredFlags[i], window.initializationFlags) < 0)
            return;
    func();
    return true;
};

window.addPostponedFunc = function(requiredFlags, funcName, func) {
    if (tryFirePostponedFunc(requiredFlags, func))
        return;
    window.funcRequirements = window.funcRequirements || {};
    window.funcRequirements[funcName] = {flags: requiredFlags, func: func};
};

window.addInitializationFlag = function(flag){
    window.initializationFlags = window.initializationFlags || [];
    window.initializationFlags.push(flag);
};


function myInArray( elem, arr, i ) {
    var len;
    if ( arr ) {
        if ( indexOf ) {
            return indexOf.call( arr, elem, i );
        }
        len = arr.length;
        i = i ? i < 0 ? Math.max( 0, len + i ) : i : 0;

        for ( ; i < len; i++ ) {
            // Skip accessing in sparse arrays
            if ( i in arr && arr[ i ] === elem ) {
                return i;
            }
        }
    }
    return -1;
}
