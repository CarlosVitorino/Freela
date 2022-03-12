
/**
 *  When service need public access...
 */
if (_env.is("dev")) {
    _service.allow()
}

/**
 * Netuno JWT Authorization Service
 */
 if (_service.path == '_auth') {
    _service.allow()
}

if (_service.path == 'Index.netuno?action=login') {
    _service.allow()
}

/*
if (_service.path == 'samples/my-service') {
    _service.allow()
}
*/
