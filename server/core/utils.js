// Calculate the weighted mean of an array of values with corresponding weights
function weightedMean(arrValues, arrWeights) {
  const result = arrValues.map((value, i) => {
      const weight = arrWeights[i];
      return [value * weight, weight];
  }).reduce((p, c) => {
      return [p[0] + c[0], p[1] + c[1]];
  }, [0, 0]);

  return result[0] / result[1];
}

// Format a Date object to 'YYYY-MM-DD'
function formatDate(date) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');
  return `${year}-${month}-${day}`;
}

// Get the start of the month for a given Date object
function startOfMonth(date) {
  return new Date(date.getFullYear(), date.getMonth(), 1);
}

// Get the end of the month for a given Date object
function endOfMonth(date) {
  const start = startOfMonth(date);
  return new Date(start.getFullYear(), start.getMonth() + 1, 0);
}

// Get the start of the year for a given Date object
function startOfYear(date) {
  return new Date(date.getFullYear(), 0, 1);
}

// Get the end of the year for a given Date object
function endOfYear(date) {
  return new Date(date.getFullYear(), 11, 31);
}

// Subtract a number of months from a given Date object
function subtractMonths(date, months) {
  const result = new Date(date);
  result.setMonth(result.getMonth() - months);
  return result;
}

// Calculate the number of days between two Date objects
function daysBetween(date1, date2) {
  return Math.floor((date2 - date1) / (1000 * 60 * 60 * 24));
}

// Calculate the number of months between two Date objects
function monthsBetween(date1, date2) {
  return (date2.getFullYear() - date1.getFullYear()) * 12 + (date2.getMonth() - date1.getMonth());
}

//  Converting a string to lowercase with hyphen for spaces
function convertLabelToValue(label) {
  let value = '';
  for (let i = 0; i < label.length; i++) {
      if (label[i] === ' ') {
          value += '-';
      } else {
          value += label[i].toLowerCase();
      }
  }
  return value;
}