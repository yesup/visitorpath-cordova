
var exec = require("cordova/exec");

function MyRoiTracking() {

};

MyRoiTracking.prototype.getTruid = function (callback) {
    exec(function (reply) {
        callback.call(undefined, reply.truid);
    }, null, "MyRoiTracking", "getTruid", []);
};

MyRoiTracking.prototype.engagement = function (callback, type, opt, value) {
    exec(function (reply) {
        if (callback && typeof (callback) === "function") {
            callback();
        }
    }, null, "MyRoiTracking", "engagement", [type, opt, value]);
};

MyRoiTracking.prototype.session = function (callback, page) {
    exec(function (reply) {
        if (callback && typeof (callback) === "function") {
            callback();
        }
    }, null, "MyRoiTracking", "session", [page]);
};

module.exports = new MyRoiTracking();