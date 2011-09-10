class Universe
  constructor: (pairs...) ->
    @data = {}
    @data[Universe.key(pair)] = true for pair in pairs

  hasCellAt: (x,y) ->
    !!@data[Universe.key([x,y])]

  neighbourCount: (pair) ->
    x = pair[0]
    y = pair[1]

    count = 0
    count +=1 if @data[Universe.key(x-1,y-1)]
    count +=1 if @data[Universe.key(x-1,y)]
    count +=1 if @data[Universe.key(x-1,y+1)]
    count +=1 if @data[Universe.key(x,y-1)]
    count +=1 if @data[Universe.key(x,y+1)]
    count +=1 if @data[Universe.key(x+1,y-1)]
    count +=1 if @data[Universe.key(x+1,y)]
    count +=1 if @data[Universe.key(x+1,y+1)]

    count

  shouldLive: (pair) ->
    count = @neighbourCount(pair)

    if this.hasCellAt(pair[0],pair[1])
      if (count is 2 or count is 3) then true else false
    else
      if (count is 3) then true else false

  tick: ->
    data = {}

    data[key] = value for key,value of @data

    #@data[key] for key, value of @data
    for key, value of @data
      pair = key.split(',')
      data[key] = @shouldLive(pair)

    console.log(@data,data)
    @data = data


Universe.key= (pair...) ->
  pair.join(',')

window.Universe = Universe
