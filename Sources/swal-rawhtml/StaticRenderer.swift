import Foundation
import CoreFoundation
import HyperSwift

struct StaticRenderer {
    let elements: [HTMLElement]
   
    func render() {
        let output = """
        <html>
            \(getHead())
            \(getBody())
        </html>
        """
        // carton can't handle file writing?? TODO
        print(output)
    }

    private func getBody() -> String {
        """
        <body>
            \(elements.map { $0.render() }.joined())
        </body>
        """
    }
    
    private func getHead() -> String {
        let fonts: String = """
            <link href="https://fonts.googleapis.com/css2?family=Trispace:wght@400;500;700&display=swap" rel="stylesheet">
        """
         let analytics: String = """
        <!-- Analytical info, you can disable this if you'd like -->
        <script type="text/javascript">
        var _paq = window._paq = window._paq || [];
        /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
            var u="https://garrepidev.matomo.cloud/";
            _paq.push(['setTrackerUrl', u+'matomo.php']);
            _paq.push(['setSiteId', '1']);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.type='text/javascript'; g.async=true; g.src='//cdn.matomo.cloud/garrepidev.matomo.cloud/matomo.js'; s.parentNode.insertBefore(g,s);
        })();
        </script>
        """
        
        return """
        <head>
            \(analytics)
            \(fonts)
        </head>
        <style>
            \(CSSStyleSheet.generateStyleSheet())
        </style>
        """
    }
}
