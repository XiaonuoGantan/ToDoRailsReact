@ToDoItemForm = React.createClass
  getInitialState: ->
    entry: ''
    due_at: ''

  valid: ->
    @state.entry && @state.due_at

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  submitItem: (e) ->
    e.preventDefault()
    $.post '', { item: @state }, (data) =>
      @props.addToDoItem data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @submitItem
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Entry'
          name: 'entry'
          value: @state.entry
          onChange: @handleChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Due At'
          name: 'due_at'
          value: @state.due_at
          onChange: @handleChange
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create To Do Item'