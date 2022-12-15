import "./ProfileLinksFooter.css"

function ProfileLinksFooter() {
    return (
      <div className="outter-footer-container">
        <div className="inner-footer-container">
          <div className="left-footer-container">
            <span className="footer-span">© 2022 rhobnb</span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">React</span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">Javascript</span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">Ruby</span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">Google Maps API</span>
          </div>
          <div className="right-footer-container">
            <span className="footer-span">
              Designed by Cath Anderson in New York, NY
            </span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">
              <a
                className="footer-span-link"
                href="https://www.linkedin.com/in/catherineanderson5/"
              >
                LinkedIn
              </a>
            </span>
            <span className="footer-separator"> · </span>
            <span className="footer-span">
              <a
                className="footer-span-link"
                href="https://github.com/cathanderson/RHOBNB"
              >
                Github
              </a>
            </span>
          </div>
        </div>
      </div>
    );
}

export default ProfileLinksFooter;
