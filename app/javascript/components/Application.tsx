import React, { useState, useEffect } from 'react'
import PropTypes from 'prop-types'

const X_DATA = [...Array(10).keys()]
const Y_DATA = [...Array(10).keys()]

export default function Application() {
  const [newFragName, setnewFragName] = useState('');
  const [newFragX, setNewFragX] = useState(null);
  const [newFragY, setNewFragY] = useState(null);
  const [fragrances, setFragrances] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    // fetch data
    const dataFetch = async () => {
      const data = await (
        await fetch(
          '/api/fragrances'
        )
      ).json();

      // set state when the data received
      setFragrances(data);
      setIsLoading(false);
      setnewFragName('');
    };

    dataFetch();
  }, []);

  async function handleSubmit(e: { preventDefault: () => void; target: any; }) {
    // Prevent the browser from reloading the page
    e.preventDefault();
    setIsLoading(true);

    // Read the form data
    const form = e.target;
    const formData = new FormData(form);
    const formJson = Object.fromEntries(formData.entries());
    const csrfTokenEl = document.querySelector('[name=csrf-token]') as HTMLMetaElement;
    const csrfToken = csrfTokenEl?.content || '';

    // You can pass formData as a fetch body directly:
    await fetch('/api/fragrances', {
      method: form.method,
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ fragrance: formJson })
    });

    const data = await (
      await fetch(
        '/api/fragrances'
      )
    ).json();

    // set state when the data received
    setFragrances(data);
    setIsLoading(false);
    setnewFragName('');
  }

  return (
    <form method="post" onSubmit={handleSubmit}>
      <table>
        <tbody>
          {
            X_DATA.map((x) =>
              <tr key={`row-${x}`}>
                {
                  Y_DATA.map((y) => {
                    const fragrance = fragrances.find((fragrance: { x: number; y: number; }) => fragrance.x === x && fragrance.y === y);
                    return (
                      <td id={`slot-x${x}-y${y}`} key={`slot-x${x}-y${y}`}>
                        {
                          fragrance ?
                          <a className="fragrance-link" href={`/frangrances/${fragrance.id}`}>{fragrance.name}</a> :
                          <>
                            <input name="empty-slot" type="radio" required={true} onClick={() => {
                              setNewFragX(x);
                              setNewFragY(y);
                            }} />
                            {
                              newFragX === x && newFragY === y ? (
                                <>
                                  <input name="x" type="hidden" value={x} />
                                  <input name="y" type="hidden" value={y} />
                                </>
                              ) : null
                            }
                          </>
                        }
                      </td>
                    )
                  })
                }
              </tr>
            )
          }
        </tbody>
      </table>
      <label>
        Name:
        <input
          id="name"
          type="text"
          name="name"
          required={true}
          value={newFragName}
          disabled={isLoading}
          onChange={(e: { target: { value: any; }; }) => setnewFragName(e.target.value)}
        />
      </label>
      <button type="submit" disabled={isLoading}>save</button>
    </form>
  )
};
