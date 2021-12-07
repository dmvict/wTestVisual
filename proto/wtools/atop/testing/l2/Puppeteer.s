( function _Puppeteer_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
_.test = _.test || Object.create( null );
_.test.visual = _.test.visual || Object.create( null );
_.test.visual.puppeteer = _.test.visual.puppeteer || Object.create( null );

let Puppeteer, PuppeteerRevisions;

//

function chromiumDownload()
{
  if( !Puppeteer )
  {
    Puppeteer = require( 'puppeteer' );
    PuppeteerRevisions = require( 'puppeteer/lib/cjs/puppeteer/revisions.js' );
  }

  let browserFetcher = Puppeteer.createBrowserFetcher();
  let targetRevision = PuppeteerRevisions.PUPPETEER_REVISIONS.chromium;
  let ready = _.Consequence.From( browserFetcher.localRevisions() );

  ready.then( ( localRevisions ) =>
  {
    if( _.longHas( localRevisions, targetRevision ) )
    return targetRevision;
    return _.Consequence.From( browserFetcher.download( targetRevision ) ).then( () => targetRevision );
  })

  return ready;
}

//

let Extension =
{
  chromiumDownload
}


Object.assign( _.test.visual.puppeteer, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
