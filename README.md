# Fold Lines

Display full-width fold lines, similar to Notepad++ or Komodo editors.

![Underline all the folds!](http://i.imgur.com/eCu5VW4.gif)

The solution is rather simple, really: It adds a "*folded*" class to the editor, similar to how the
line number is marked.  Therefore, to modify the style of the line marker, you could do something
like this in your styles.less file:

```sass
atom-text-editor.editor .line.folded {
  border-bottom: 1px dashed salmon;  // Mmm.. salmon..
}
```

To remove underline from the line number marker:
```sass
atom-text-editor.editor .line-number.folded {
  border-bottom: none;
}
```

To hide default fold marker (which I feel to be redundant while fold lines are visible):
```sass
atom-text-editor.editor .fold-marker {
  display: none;
}
```

### Goals / TODO:
* [ ] Write specs
* [ ] Config option to hide default fold marker
* [ ] Fold lines in minimap.  Hmm&hellip;
* [ ] Get mainline Atom to include this
