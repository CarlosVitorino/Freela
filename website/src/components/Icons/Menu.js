import React from "react";

export default function MenuIcon() {
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
          fill="#9C9DAF"
          stroke="black"
          strokeWidth="4"
          strokeLinejoin="round"
        />
        <path d="M24 58H64" stroke="black" strokeWidth="8" />
        <path d="M24 44H64" stroke="black" strokeWidth="8" />
        <path d="M24 30H64" stroke="black" strokeWidth="8" />
      </svg>
    </span>
  );
}
