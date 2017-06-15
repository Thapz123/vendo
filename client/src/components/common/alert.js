import React from 'react';

export default const alert = ({message}) => {
  return(
    <div>
      <span><strong>Error!</strong> { message } </span>
    </div>
  )
};
