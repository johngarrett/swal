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
    
     func getHead() -> String {
        let fonts: String = """
            <link href="https://fonts.googleapis.com/css2?family=Trispace:wght@400;500;700&display=swap" rel="stylesheet">
        """
         let analytics: String = """
            <title>Swift, WebAssembly, and Algorithms</title>
            <meta property="description" content="A sandox to explore Swift Algorithms, from the browser, using WASM">
            <meta property="og:url" content="https://garrepi.dev/swal">
            <meta property="og:type" content="website">
            <meta property="og:title" content="Swift, WebAssembly, and Algorithms">
            <meta property="og:description" content="A sandox to explore Swift Algorithms, from the browser, using WASM">
            <meta property="og:image" content="https://garrepi.dev/images/prj/swal.png">
            <meta property="og:image:secure_url" content="https://garrepi.dev/images/prj/swal.png">
            <!-- Twitter Meta Tags -->
            <meta name="twitter:card" content="summary_large_image">
            <meta property="twitter:domain" content="garrepi.dev">
            <meta property="twitter:url" content="https://garrepi.dev/swal">
            <meta name="twitter:title" content="Swift, WebAssembly, and  Algorithms">
            <meta name="twitter:description" content="A sandox to explore Swift Algorithms, from the browser, using WASM">
            <meta name="twitter:image" content="https://garrepi.dev/images/prj/swal.png">
            <meta property="og:locale" content="en_US">
            <meta property="og:type" content="website">
            <meta property="og:site_name" content="garrepidev">
            <link rel="icon" type="image/jpeg" href="/images/prj/swal.png">
            <meta name="viewport" content="width=device-width, initial-scale=0.86, maximum-scale=3.0, minimum-scale=0.86">
            <!-- I know, I hate google anayltics. i'm looking for free alternatives - you can disable this if you'd like -->
            <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-YZD103LZ87"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'G-YZD103LZ87');
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
