import React from "react"
import PropTypes from "prop-types"

const X_DATA = [...Array(10).keys()]
const Y_DATA = [...Array(10).keys()]

class Application extends React.Component {
  render () {
    return (
      <>
        <table>
          <tbody>
            {
              X_DATA.map((x, index) => 
                <tr key={index}>
                  {
                    Y_DATA.map((y, index2) => 
                      <td id={`slot-x${x}-y${y}`}><input name="empty-slot" key={index2} type="radio" /></td>
                    )
                  }
                </tr>
              )
            }
          </tbody>
        </table>
        <label htmlFor="name">Name:</label>
        <input id="name" type="text" name="name" />
        <button type="button">save</button>
      </>
    );
  }
}

export default Application
