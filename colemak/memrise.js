(() => {

  function getWords(courseId, level) {
    const url = `https://www.memrise.com/ajax/session/?course_id=${courseId}&level_index=${level}&session_slug=preview`
    console.log('Fetching words from ' + url)
    return fetch(url, { credentials: 'same-origin' })
      // parse response
      .then(res => {
        return res.status === 200
          ? res.json()
            // map results
            .then(data => {
              console.log(data)
              return data.learnables.map(row => ({
                original: row.item.value,
                translation: row.definition.value
              }))
            })
            .then(words => {
              return getWords(courseId, level + 1)
                .then(words.concat.bind(words))
            })
          : []
      })
      .catch(err => {
        console.error(err)
        return []
      })
  }

  // fetch
  const start = 1
  const courseId = location.href.slice(30).match(/\d+/)[0]
  getWords(courseId, start)
    // format as csv
    .then(words => {
      console.log(words.length + ' words')
      return words.map(word => word.translation + '\t' + word.original + '\n').join('')
    })
    // print
    .then(console.log)

})()
