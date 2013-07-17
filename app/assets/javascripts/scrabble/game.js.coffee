//= require ./tile_collection
//= require ./tile
//= require ./bag
//= require ./rack
//= require ./board
$().ready ->
  window.Game = class Game
    constructor: ->
      @bag = new Bag
      @bag.fill()
      @rack = new Rack
      @fill_rack()
      @board = new Board

    fill_rack: ->
      number_to_fill = @rack.quanity_until_full()
      returned_tiles = @bag.take_up_to(number_to_fill)
      @rack.tiles.add (returned_tiles)

    swap_tiles: (tiles) ->
      tiles = @bag.to_array tiles
      for tile in tiles
        @rack.remove tile
        @bag.tiles.add(tile)
      @fill_rack()

  game = new Game
  console.log game