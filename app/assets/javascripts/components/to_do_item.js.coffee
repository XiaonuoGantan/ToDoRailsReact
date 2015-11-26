@ToDoItem = React.createClass
  getInitialState: ->
    edit: false

  delete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/to_do_items/#{ @props.item.id }"
      dataType: 'json'
      success: () =>
        @props.deleteItem @props.item

  toggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  edit: (e) ->
    e.preventDefault()
    data =
      entry: React.findDOMNode(@refs.entry).value
      due_at: React.findDOMNode(@refs.due_at).value
    $.ajax
      method: 'PUT'
      url: "/to_do_items/#{ @props.item.id }"
      dataType: 'JSON'
      data:
        item: data
      success: (data) =>
        @setState edit: false
        @props.editItem @props.item, data

  renderRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.item.entry
      React.DOM.td null, @props.item.due_at
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @toggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @delete
          'Delete'

  renderForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.item.entry
          ref: 'entry'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.item.due_at
          ref: 'due_at'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @edit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @toggle
          'Cancel'

  render: ->
    if @state.edit
      @renderForm()
    else
      @renderRow()