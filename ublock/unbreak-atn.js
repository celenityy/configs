unbreak-atn.js text/javascript
(function() {
    const originalXHR = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function(method, url) {
        this.addEventListener('readystatechange', function() {
            if (this.readyState === this.HEADERS_RECEIVED) {
                if (url.includes('/user-media/addons/_attachments/')) {
                    const headerNames = this.getAllResponseHeaders().split('\n');
                    headerNames.forEach(header => {
                        const name = header.split(':')[0].trim();
                        if (name.toLowerCase() === 'content-disposition') {
                            try {
                                this.setRequestHeader(name, '');
                            } catch(e) {}
                        }
                    });
                }
            }
        });
        return originalXHR.apply(this, arguments);
    };
})();
