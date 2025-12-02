unbreak-atn.js text/javascript
(function() {
    const targetPrefix = 'https://addons.thunderbird.net/user-media/addons/_attachments/';
    
    const originalFetch = window.fetch;
    window.fetch = function(input, init) {
        if (typeof input === 'string' && input.startsWith(targetPrefix)) {
            // Clone the init object to avoid modifying the original
            const modifiedInit = init ? {...init} : {};
            
            // Intercept and modify headers
            if (!modifiedInit.headers) {
                modifiedInit.headers = new Headers();
            }
            
            // Remove content-disposition header if it exists
            if (modifiedInit.headers instanceof Headers) {
                modifiedInit.headers.delete('content-disposition');
            } else if (Array.isArray(modifiedInit.headers)) {
                modifiedInit.headers = modifiedInit.headers.filter(
                    header => header[0].toLowerCase() !== 'content-disposition'
                );
            } else if (typeof modifiedInit.headers === 'object') {
                delete modifiedInit.headers['content-disposition'];
            }
            
            return originalFetch(input, modifiedInit);
        }
        
        return originalFetch(input, init);
    };
})();
