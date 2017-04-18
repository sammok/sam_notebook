//  test case
let rules = [
    {
        rule: 'yyyymmdd',
        value: beginDate,
        msg: 'beginDate: 2017-01-01'
    },
    {
        rule: 'grade',
        value: grade,
        msg: 'grade: {number}'
    },
    {
        rule: 'subject',
        value: subjectCode,
        msg: 'subjectCode: "Math"'
    }
];

let testResult = throwParameterError(rules);

//   Core function
const parameterVerification = (data) => {
    var result = true;
    var messages = [];
    var obj_toStr = Object.prototype.toString;
    var rules = {
        yyyymmdd: /....-..-../,
        grade: /\d{0, 1}/,
        subject: /math/
    };

    if (obj_toStr.call(data) == '[object Array]') {
        data.forEach(function (data) {
            if (runVerification(data) == false) result = false;
        });
    } else {
        result = runVerification(data);
    }

    function runVerification (data) {
        var result;

        //  if rule is a regular exp
        if (obj_toStr.call(data.rule) == '[object RegExp]') {
            result = data.rule.test(data.value);
            !result && messages.push(data.message || '');
            return result;
        }

        //  if rule is a function
        if (obj_toStr.call(data.rule) == '[object Function]') {
            result = data.rule(data.value);
            !result && messages.push(data.message || '');
            return result;
        }

        //  if rule is one of preset rule above
        result = rules[data.rule].test(data.value ? (data.value).toString().toLowerCase() : '');
        !result && messages.push(data.msg);

        return result;
    }

    return {
        result: result,
        messages: 'parameters verification failure: ' + messages.join(', ')
    };
}
