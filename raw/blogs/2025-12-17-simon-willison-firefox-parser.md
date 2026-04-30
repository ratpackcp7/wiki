---
source_url: https://simonwillison.net/2025/Dec/17/firefox-parser/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-17-simon-willison-firefox-parser
---

# Firefox's Java-to-C++ HTML5 Parser

# Firefox's Java-to-C++ HTML5 Parser

Simon Willison highlights a unique technical detail regarding Firefox's architecture: the browser's **HTML5 Parser** is maintained as **Java code** and then automatically translated into **C++** for production use.

## Key Discovery
The Firefox HTML5 parser is not written directly in C++. Instead, the source of truth is Java code located in the `parser/html/javasrc` directory of the Firefox repository. A custom translation script converts this Java logic into the C++ files used by the browser engine.

### How to Run the Translation
```bash
cd parser/html/java
make sync
make translate
```

## The Translation Engine
The code responsible for this translation is hosted externally in the [Nu Html Checker](https://github.com/validator/validator) repository. This is the same codebase that powers the **W3C Nu HTML Validation Service**.

### Code Snippet: Java to C++ Conversion
```java
protected void startClassDeclaration() {
    printer.print("#define ");
    printer.print(className);
    printer.printLn("_cpp__");
    printer.printLn();

    for (int i = 0; i < Main.H_LIST.length; i++) {
        String klazz = Main.H_LIST[i];
        if (!klazz.equals(javaClassName)) {
            printer.print("#include \"");
            printer.print(cppTypes.classPrefix());
            printer.print(klazz);
            printer.printLn(".h\"");
        }
    }

    printer.printLn();
    printer.print("#include \"");
    printer.print(className);
    printer.printLn(".h\"");
    printer.printLn();
}
```

## Historical Context
*   **Origin:** This approach was introduced in **2009** by **Henri Sivonen** (author of the validator).
*   **Rationale:** John Resig documented this transition in a [2009 blog post](https://johnresig.com/blog/html-5-parsing/), explaining how the new parser was integrated into Firefox to ensure compliance with the then-emerging HTML5 specification.

## Links
*   [Firefox Parser Java Source](https://github.com/mozilla-firefox/firefox/tree/main/parser/html/java)
*   [Nu Html Checker Repository](https://github.com/validator/validator)
