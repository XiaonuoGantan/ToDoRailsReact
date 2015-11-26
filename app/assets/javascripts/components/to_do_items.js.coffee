@ToDoItems = React.createClass
  getInitialState: ->
    items: @props.data

  getDefaultProps: ->
    items: []

  addItem: (item) ->
    items = React.addons.update(@state.items, { $push: [item] })
    @setState items: items

  deleteItem: (item) ->
    index = @state.items.indexOf item
    items = React.addons.update(@state.items, { $splice: [[index, 1]] })
    @replaceState items: items

  updateItem: (item, data) ->
    index = @state.items.indexOf item
    items = React.addons.update(@state.items, { $splice: [[index, 1, data]] })
    @replaceState items: items

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Records'
      React.DOM.hr null
      React.createElement ToDoItemForm, addToDoItem: @addItem
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Entry'
            React.DOM.th null, 'Due At'
            React.DOM.th null, 'Action'
        React.DOM.tbody null,
          for item in @state.items
            React.createElement ToDoItem, key: item.id, item: item, deleteItem: @deleteItem, editItem: @updateItem