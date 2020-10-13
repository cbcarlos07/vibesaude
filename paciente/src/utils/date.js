

const mountDate = data => {
    const day   = data.getDate() < 10 ? `0${data.getDate()}` : data.getDate();
    const month = data.getMonth() + 1 < 10 ? `0${data.getMonth() + 1}` : data.getMonth() + 1;
    return `${data.getFullYear()}-${month}-${day}`        
}

export default mountDate