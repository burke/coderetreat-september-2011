(function() {
  var Universe;
  var __slice = Array.prototype.slice;
  Universe = (function() {
    function Universe() {
      var pair, pairs, _i, _len;
      pairs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      this.data = {};
      for (_i = 0, _len = pairs.length; _i < _len; _i++) {
        pair = pairs[_i];
        this.data[Universe.key(pair)] = true;
      }
    }
    Universe.prototype.hasCellAt = function(x, y) {
      return !!this.data[Universe.key([x, y])];
    };
    Universe.prototype.neighbourCount = function(pair) {
      var count, x, y;
      x = pair[0];
      y = pair[1];
      count = 0;
      if (this.data[Universe.key(x - 1, y - 1)]) {
        count += 1;
      }
      if (this.data[Universe.key(x - 1, y)]) {
        count += 1;
      }
      if (this.data[Universe.key(x - 1, y + 1)]) {
        count += 1;
      }
      if (this.data[Universe.key(x, y - 1)]) {
        count += 1;
      }
      if (this.data[Universe.key(x, y + 1)]) {
        count += 1;
      }
      if (this.data[Universe.key(x + 1, y - 1)]) {
        count += 1;
      }
      if (this.data[Universe.key(x + 1, y)]) {
        count += 1;
      }
      if (this.data[Universe.key(x + 1, y + 1)]) {
        count += 1;
      }
      return count;
    };
    Universe.prototype.shouldLive = function(pair) {
      var count;
      count = this.neighbourCount(pair);
      if (this.hasCellAt(pair[0], pair[1])) {
        if (count === 2 || count === 3) {
          return true;
        } else {
          return false;
        }
      } else {
        if (count === 3) {
          return true;
        } else {
          return false;
        }
      }
    };
    Universe.prototype.tick = function() {
      var data, key, pair, value, _ref, _ref2;
      data = {};
      _ref = this.data;
      for (key in _ref) {
        value = _ref[key];
        data[key] = value;
      }
      _ref2 = this.data;
      for (key in _ref2) {
        value = _ref2[key];
        pair = key.split(',');
        data[key] = this.shouldLive(pair);
      }
      console.log(this.data, data);
      return this.data = data;
    };
    return Universe;
  })();
  Universe.key = function() {
    var pair;
    pair = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return pair.join(',');
  };
  window.Universe = Universe;
}).call(this);
