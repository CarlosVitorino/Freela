import React from "react";

export default function OptionsIcon() {
  return (
    <span
      role="img"
      aria-label="user"
      className="anticon anticon-user ant-menu-item-icon"
    >
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
          fill="#FFB443"
          stroke="black"
          strokeWidth="4"
          strokeLinejoin="round"
        />
        <path d="M33 64L33 24" stroke="black" strokeWidth="6" />
        <path d="M55 64L55 24" stroke="black" strokeWidth="6" />
        <rect x="48" y="24" width="14" height="14" fill="black" />
        <rect x="26" y="42" width="14" height="14" fill="black" />
      </svg>
    </span>
  );
}
