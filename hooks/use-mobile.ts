"use client"

import * as React from "react"

const MOBILE_BREAKPOINT = 768

export function useIsMobile() {
  //  Initialize with false to prevent hydration mismatch
  const [isMobile, setIsMobile] = React.useState<boolean>(false)
  //  Add hydrated state to prevent server/client mismatch
  const [isHydrated, setIsHydrated] = React.useState(false)

  React.useEffect(() => {
    //  Set hydrated to true on first render
    setIsHydrated(true)
    
    const mql = window.matchMedia(`(max-width: ${MOBILE_BREAKPOINT - 1}px)`)
    const onChange = () => {
      setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    }
    mql.addEventListener("change", onChange)
    setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    return () => mql.removeEventListener("change", onChange)
  }, [])

  //  Return false during SSR to prevent hydration mismatch
  return isHydrated ? isMobile : false
}
