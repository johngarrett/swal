## SWAL

> Swift, Wasm, and Algorithms

Try it out [here](https://garrepi.dev/swal)

### purpose 

really just to explore SwiftWasm in a meaningful way. hopefully, someone finds directly interacting with the algorithms in [this swift library](https://github.com/apple/swift-algorithms) useful

### contributing

feel free to contribute! I have a habit of starting projects and never finishing... 

the hosted version of this has to be updated manually by me (running it through my [static site](https://github.com/johngarrett/johngarrett.github.io))

also, `FileManager` and `String.write(to:,_:,_:)` seem to be broken in the wasm fork of swift. because of that, html is directly injected into the DOM. `StaticRenderer` is _suopssed_ to render all the HyperSwift into a html and css file but, without the ability to write, that's not being done.

### status

- [X] Combinations  
- [X] Permutations  
- [X] Rotations  
- [ ] Partitions  
- [ ] Chain  
- [ ] Product  
- [ ] Cycled  
- [ ] Random Subset  
- [ ] Stable Subset  
- [ ] Uniqued  
- [ ] Chunked  
- [ ] Indexed  
