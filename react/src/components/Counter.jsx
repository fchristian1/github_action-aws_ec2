import { React, useState } from 'react'

function Counter() {
    const [counter, setCounter] = useState(0);
    return (<>
        <p>
            <button onClick={() => setCounter(counter - 1)}>-</button>
            <button>{counter}</button>
            <button onClick={() => setCounter(counter + 1)}>+</button>
        </p>
    </>)
}

export default Counter