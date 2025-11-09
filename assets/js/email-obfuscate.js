/**
 * Email Obfuscation Utility
 * Prevents email harvesting by bots while maintaining usability for humans
 *
 * Usage:
 * <a href="#" class="email-link" data-user="username" data-domain="example.com">Contact</a>
 * <span class="email-text" data-user="username" data-domain="example.com"></span>
 */

(function() {
  'use strict';

  /**
   * Decode and activate email links
   */
  function activateEmailLinks() {
    // Handle clickable email links
    document.querySelectorAll('.email-link').forEach(link => {
      const user = link.dataset.user;
      const domain = link.dataset.domain;

      if (user && domain) {
        link.href = `mailto:${user}@${domain}`;

        // If link has no text, set it to the email address
        if (!link.textContent.trim()) {
          link.textContent = `${user}@${domain}`;
        }
      }
    });

    // Handle plain text email displays
    document.querySelectorAll('.email-text').forEach(span => {
      const user = span.dataset.user;
      const domain = span.dataset.domain;

      if (user && domain) {
        span.textContent = `${user}@${domain}`;
      }
    });
  }

  // Activate emails when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', activateEmailLinks);
  } else {
    activateEmailLinks();
  }
})();
