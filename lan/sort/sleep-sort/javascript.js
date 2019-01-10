const timeout = time =>
	new Promise(resolve => void setTimeout(resolve, time)).catch(console.error);

const sort = async arr => {
	if (!Array.isArray(arr)) return [];

	const result = [];
	arr.forEach(async ele => {
		await timeout(ele * arr.length);
		result.push(ele);
	});

	await timeout(Math.max(...arr));
	return result;
};

const test = async () => {
	const result = await sort([2, 3, 1, 4, 5, 56, 61, 1, 2, 4, 5, 6, 21, 2, 12]);
	console.log(result);
};

test();
