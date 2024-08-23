import React from 'react';

export default function UserIcon() {
  return (
    <span role="img" aria-label="user" className="anticon anticon-user ant-menu-item-icon">
      <svg
        width="2em"
        height="2em"
        viewBox="0 0 96 96"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect
          x="18"
          y="18"
          width="68"
          height="68"
          fill="black"
          stroke="black"
          strokeWidth="4"
          strokeLinejoin="round"
        />
        <rect
          x="10"
          y="10"
          width="68"
          height="68"
          fill="#DD7DFF"
          stroke="black"
          strokeWidth="4"
          strokeLinejoin="round"
        />
        <path
          d="M25 70.4009C25.4129 44.6641 63.3115 47.0988 62.5 70.4009"
          stroke="black"
          strokeWidth="5"
        />
        <circle cx="44" cy="32" r="11.5" stroke="black" strokeWidth="5" />
      </svg>
    </span>
  );
}
