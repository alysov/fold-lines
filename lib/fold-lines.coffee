{CompositeDisposable} = require 'atom'

module.exports = FoldLines =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.workspace.observeTextEditors (editor) =>
      buffer = editor.getBuffer()
        
      # Handle current folds.
      markers = buffer.findMarkers(editor.displayBuffer.getFoldMarkerAttributes())
      @decorateFold(editor, marker) for marker in markers
      
      # Subscribe to all future folds.
      @subscriptions.add buffer.onDidCreateMarker (marker) =>
        @handleBufferMarkerCreated editor, marker

  deactivate: ->
    @subscriptions.dispose()
  
  handleBufferMarkerCreated: (editor, marker) ->
    props = marker.getProperties()
    if (props.class == 'fold')
      @decorateFold editor, marker

  decorateFold: (editor, marker) ->
    editor.decorateMarker(marker, { type: 'line', class: 'folded' })
    