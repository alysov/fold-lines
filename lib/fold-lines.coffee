{CompositeDisposable} = require 'atom'

module.exports = FoldLines =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.workspace.observeTextEditors (editor) =>
      foldsLayer = editor.displayLayer.foldsMarkerLayer

      # Handle current folds.
      markers = foldsLayer.getMarkers()
      @decorateFold(editor, marker) for marker in markers

      # Subscribe to all future folds.
      @subscriptions.add foldsLayer.onDidCreateMarker (marker) =>
        @decorateFold editor, marker

  deactivate: ->
    @subscriptions.dispose()

  decorateFold: (editor, marker) ->
    editor.decorateMarker(marker, { type: 'line', class: 'folded' })
